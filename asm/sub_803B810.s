	.syntax unified
	.set sub_80194BC, 0x080194BC + 1
	.set sub_801A05C, 0x0801A05C + 1
	.section .text.sub_803B810, "ax", %progbits
@ sub_803B810 @ JP 0x0803B810 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803B810
	.thumb_func
sub_803B810:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	mov sb, r1
	movs r0, #0xff
	mov sl, r0
	ldr r0, _0803B854 @ =0x0203AA00
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803B85C
	ldr r4, _0803B858 @ =0x0202E4DC
	ldr r0, [r4]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80194BC
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r5, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	b _0803B862
	.align 2, 0
_0803B854: .4byte 0x0203AA00
_0803B858: .4byte 0x0202E4DC
_0803B85C:
	adds r0, r5, #0
	bl sub_801A05C
_0803B862:
	ldr r1, _0803B8E0 @ =0x0202E4D0
	movs r2, #2
	ldrsh r0, [r1, r2]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803B8D6
_0803B86E:
	ldr r1, _0803B8E0 @ =0x0202E4D0
	movs r2, #0
	ldrsh r0, [r1, r2]
	subs r3, r0, #1
	subs r0, r5, #1
	mov r8, r0
	cmp r3, #0
	blt _0803B8D0
	lsls r4, r5, #2
	ldr r1, _0803B8E4 @ =0x0202E4DC
	mov ip, r1
	ldr r7, _0803B8E8 @ =0x0202E4D4
	ldr r6, _0803B8EC @ =0x0202BE40
	ldr r1, _0803B8F0 @ =0x0202E4EC
_0803B88A:
	mov r2, ip
	ldr r0, [r2]
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803B8CA
	ldr r0, [r7]
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803B8AE
	ldrb r2, [r6]
	cmp r0, r2
	bne _0803B8CA
_0803B8AE:
	ldr r0, [r1]
	adds r2, r4, r0
	ldr r0, [r2]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp sl, r0
	blo _0803B8CA
	mov r0, sb
	strh r3, [r0]
	strh r5, [r0, #2]
	ldr r0, [r2]
	adds r0, r0, r3
	ldrb r0, [r0]
	mov sl, r0
_0803B8CA:
	subs r3, #1
	cmp r3, #0
	bge _0803B88A
_0803B8D0:
	mov r5, r8
	cmp r5, #0
	bge _0803B86E
_0803B8D6:
	mov r1, sl
	cmp r1, #0xff
	bne _0803B8F4
	movs r0, #0
	b _0803B8F6
	.align 2, 0
_0803B8E0: .4byte 0x0202E4D0
_0803B8E4: .4byte 0x0202E4DC
_0803B8E8: .4byte 0x0202E4D4
_0803B8EC: .4byte 0x0202BE40
_0803B8F0: .4byte 0x0202E4EC
_0803B8F4:
	movs r0, #1
_0803B8F6:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

