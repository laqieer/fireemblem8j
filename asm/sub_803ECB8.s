	.syntax unified
	.set AiSetDecision, 0x08039C98 + 1
	.set AreUnitsAllied, 0x08024D3C + 1
	.set GetUnit, 0x08019108 + 1
	.set MapAddInRange, 0x0801A798 + 1
	.set sub_80194BC, 0x080194BC + 1
	.section .text.sub_803ECB8, "ax", %progbits
@ sub_803ECB8 @ JP 0x0803ECB8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803ECB8
	.thumb_func
sub_803ECB8:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov sl, r0
	str r1, [sp, #0xc]
	movs r0, #0
	mov r8, r0
	mov sb, r0
	ldr r0, _0803ED98 @ =0x03004DF0
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x30
	ands r0, r1
	cmp r0, #0
	beq _0803ED94
	ldr r0, _0803ED9C @ =0x0202E4DC
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80194BC
	mov r0, sl
	ldr r1, [sp, #0xc]
	movs r2, #1
	movs r3, #1
	bl MapAddInRange
	ldr r0, _0803EDA0 @ =0x0202E4D0
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _0803ED8E
_0803ED08:
	ldr r0, _0803EDA0 @ =0x0202E4D0
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r7, r1, #1
	cmp r4, #0
	blt _0803ED88
	lsls r5, r1, #2
_0803ED18:
	ldr r0, _0803ED9C @ =0x0202E4DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803ED82
	ldr r6, _0803EDA4 @ =0x0202E4D4
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803ED82
	ldr r0, _0803EDA8 @ =0x0202BE40
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803ED82
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl GetUnit
	adds r2, r0, #0
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x30
	ands r0, r1
	cmp r0, #0
	bne _0803ED82
	movs r0, #8
	ldrsb r0, [r2, r0]
	cmp r8, r0
	bge _0803ED82
	ldrb r2, [r2, #8]
	mov r8, r2
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	mov sb, r0
_0803ED82:
	subs r4, #1
	cmp r4, #0
	bge _0803ED18
_0803ED88:
	adds r1, r7, #0
	cmp r1, #0
	bge _0803ED08
_0803ED8E:
	mov r0, r8
	cmp r0, #0
	bne _0803EDAC
_0803ED94:
	movs r0, #0
	b _0803EDCA
	.align 2, 0
_0803ED98: .4byte 0x03004DF0
_0803ED9C: .4byte 0x0202E4DC
_0803EDA0: .4byte 0x0202E4D0
_0803EDA4: .4byte 0x0202E4D4
_0803EDA8: .4byte 0x0202BE40
_0803EDAC:
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	ldr r2, [sp, #0xc]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	movs r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #7
	mov r3, sb
	bl AiSetDecision
	movs r0, #1
_0803EDCA:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

