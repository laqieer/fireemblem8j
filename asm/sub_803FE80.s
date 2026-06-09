	.syntax unified
	.set AiSetDecision, 0x08039C98 + 1
	.set MapAddInRange, 0x0801A798 + 1
	.set sub_8018730, 0x08018730 + 1
	.set sub_80194BC, 0x080194BC + 1
	.set sub_801B620, 0x0801B620 + 1
	.set sub_803C2F4, 0x0803C2F4 + 1
	.set sub_803C340, 0x0803C340 + 1
	.set sub_803C420, 0x0803C420 + 1
	.section .text.sub_803FE80, "ax", %progbits
@ sub_803FE80 @ JP 0x0803FE80 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803FE80
	.thumb_func
sub_803FE80:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp, #0xc]
	movs r0, #0
	mov r8, r0
	mov sb, r0
	mov sl, r0
	ldr r0, _0803FF70 @ =0x0203AA00
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0803FF60
	bl sub_803C2F4
	cmp r0, #2
	ble _0803FF60
	ldr r0, _0803FF74 @ =0x03004DF0
	ldr r0, [r0]
	bl sub_803C420
	movs r0, #1
	rsbs r0, r0, #0
	bl sub_801B620
	ldr r0, _0803FF78 @ =0x0202E4D0
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803FF38
_0803FEC8:
	ldr r0, _0803FF78 @ =0x0202E4D0
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r7, r5, #1
	cmp r4, #0
	blt _0803FF32
	lsls r6, r5, #2
_0803FED8:
	ldr r0, _0803FF7C @ =0x0202E4DC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803FF2C
	ldr r0, _0803FF80 @ =0x0202E4D4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	cmp r1, #0
	beq _0803FF00
	ldr r0, _0803FF84 @ =0x0202BE40
	ldrb r0, [r0]
	cmp r1, r0
	bne _0803FF2C
_0803FF00:
	ldr r0, _0803FF88 @ =0x0202E4E0
	ldr r0, [r0]
	movs r1, #0
	bl sub_80194BC
	ldr r0, _0803FF74 @ =0x03004DF0
	ldr r0, [r0]
	bl sub_8018730
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl MapAddInRange
	bl sub_803C340
	cmp r0, r8
	ble _0803FF2C
	mov r8, r0
	mov sb, r4
	mov sl, r5
_0803FF2C:
	subs r4, #1
	cmp r4, #0
	bge _0803FED8
_0803FF32:
	adds r5, r7, #0
	cmp r5, #0
	bge _0803FEC8
_0803FF38:
	mov r3, r8
	cmp r3, #1
	ble _0803FF60
	mov r1, sb
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r2, sl
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	ldr r3, [sp, #0xc]
	lsls r2, r3, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #5
	movs r3, #0
	bl AiSetDecision
_0803FF60:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803FF70: .4byte 0x0203AA00
_0803FF74: .4byte 0x03004DF0
_0803FF78: .4byte 0x0202E4D0
_0803FF7C: .4byte 0x0202E4DC
_0803FF80: .4byte 0x0202E4D4
_0803FF84: .4byte 0x0202BE40
_0803FF88: .4byte 0x0202E4E0

