	.syntax unified
	.set AiSetDecision, 0x08039C98 + 1
	.set NextRN_N, 0x08000C58 + 1
	.set sub_801A05C, 0x0801A05C + 1
	.section .text.sub_803AB9C, "ax", %progbits
@ sub_803AB9C @ JP 0x0803AB9C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803AB9C
	.thumb_func
sub_803AB9C:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	movs r0, #0
	mov r8, r0
	mov sb, r0
	ldr r0, _0803ABC4 @ =0x03004DF0
	ldr r0, [r0]
	bl sub_801A05C
	movs r1, #1
	rsbs r1, r1, #0
	ldr r0, _0803ABC8 @ =0x0202E4D0
	ldrh r0, [r0, #2]
	subs r0, #1
	lsls r0, r0, #0x10
	b _0803AC24
	.align 2, 0
_0803ABC4: .4byte 0x03004DF0
_0803ABC8: .4byte 0x0202E4D0
_0803ABCC:
	ldr r0, _0803AC50 @ =0x0202E4D0
	ldrh r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	subs r7, r5, #1
	cmp r4, #0
	blt _0803AC22
	lsls r6, r5, #2
_0803ABDE:
	ldr r0, _0803AC54 @ =0x0202E4DC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803AC18
	ldr r0, _0803AC58 @ =0x0202E4D4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803AC18
	movs r0, #0x80
	lsls r0, r0, #1
	str r1, [sp, #0xc]
	bl NextRN_N
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [sp, #0xc]
	cmp r0, r8
	blo _0803AC18
	mov r8, r0
	adds r1, r4, #0
	mov sb, r5
_0803AC18:
	subs r0, r4, #1
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	bge _0803ABDE
_0803AC22:
	lsls r0, r7, #0x10
_0803AC24:
	asrs r5, r0, #0x10
	cmp r5, #0
	bge _0803ABCC
	cmp r1, #0
	blt _0803AC42
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r1, #0
	mov r1, sb
	movs r2, #0
	movs r3, #0
	bl AiSetDecision
_0803AC42:
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803AC50: .4byte 0x0202E4D0
_0803AC54: .4byte 0x0202E4DC
_0803AC58: .4byte 0x0202E4D4

