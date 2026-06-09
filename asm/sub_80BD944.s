	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_80C2E8C, 0x080C2E8C + 1
	.set sub_80C41F0, 0x080C41F0 + 1
	.set sub_80C5604, 0x080C5604 + 1
	.set sub_80C5628, 0x080C5628 + 1
	.section .text.sub_80BD944, "ax", %progbits
@ sub_80BD944 @ JP 0x080BD944 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BD944
	.thumb_func
sub_80BD944:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	adds r7, r0, #0
	adds r0, #0x40
	movs r2, #0
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r3, r7, #0
	adds r3, #0x29
	ldrb r0, [r3]
	movs r1, #2
	orrs r0, r1
	strb r0, [r3]
	ldr r0, _080BD9C8 @ =0x03005270
	mov r8, r0
	strb r2, [r0, #1]
	ldr r0, [r7, #0x54]
	mov r4, sp
	adds r4, #0xa
	movs r1, #0
	add r2, sp, #8
	adds r3, r4, #0
	bl sub_80C2E8C
	add r0, sp, #8
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r4, r2]
	subs r1, #0xe
	add r5, sp, #0xc
	mov r6, sp
	adds r6, #0xe
	adds r2, r5, #0
	adds r3, r6, #0
	bl sub_80C5628
	mov r3, r8
	movs r4, #2
	ldrsh r0, [r3, r4]
	movs r2, #4
	ldrsh r1, [r3, r2]
	movs r3, #0
	ldrsh r2, [r5, r3]
	movs r4, #0
	ldrsh r3, [r6, r4]
	movs r4, #2
	str r4, [sp]
	bl sub_80C5604
	asrs r0, r0, #2
	cmp r0, #1
	bgt _080BD9CC
	ldrh r0, [r5]
	mov r1, r8
	strh r0, [r1, #2]
	ldrh r0, [r6]
	strh r0, [r1, #4]
	adds r0, r7, #0
	movs r1, #7
	bl Proc_Goto
	b _080BD9F6
	.align 2, 0
_080BD9C8: .4byte 0x03005270
_080BD9CC:
	cmp r0, #0xf
	bgt _080BD9D4
	movs r0, #0x10
	b _080BD9DA
_080BD9D4:
	cmp r0, #0x4b
	ble _080BD9DA
	movs r0, #0x4b
_080BD9DA:
	movs r1, #1
	rsbs r1, r1, #0
	movs r3, #0
	ldrsh r2, [r5, r3]
	movs r4, #0
	ldrsh r3, [r6, r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r1, #0
	bl sub_80C41F0
_080BD9F6:
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

