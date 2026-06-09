	.syntax unified
	.set MultiBootCheckComplete, 0x0804ECA8 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8043190, 0x08043190 + 1
	.set sub_804E790, 0x0804E790 + 1
	.set sub_804EBF0, 0x0804EBF0 + 1
	.section .text.sub_80489C8, "ax", %progbits
@ sub_80489C8 @ JP 0x080489C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80489C8
	.thumb_func
sub_80489C8:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	movs r2, #1
	ldr r5, _080489E8 @ =0x03004EB0
	movs r4, #1
	ldr r3, _080489EC @ =0x085D31E8
_080489D6:
	ldrb r1, [r5, #0x1d]
	asrs r1, r2
	ands r1, r4
	cmp r1, #0
	bne _080489F0
	ldr r0, [r3]
	adds r0, #0xb
	adds r0, r0, r2
	b _08048A0C
	.align 2, 0
_080489E8: .4byte 0x03004EB0
_080489EC: .4byte 0x085D31E8
_080489F0:
	ldrb r0, [r5, #0x1e]
	asrs r0, r2
	ands r0, r4
	cmp r0, #0
	bne _08048A04
	ldr r0, [r3]
	adds r0, #0xb
	adds r0, r0, r2
	strb r4, [r0]
	b _08048A0E
_08048A04:
	ldr r0, [r3]
	adds r0, #0xb
	adds r0, r0, r2
	movs r1, #3
_08048A0C:
	strb r1, [r0]
_08048A0E:
	adds r2, #1
	cmp r2, #3
	ble _080489D6
	adds r0, r7, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r6, r0, #0
	cmp r1, #0
	bne _08048A44
	ldr r0, _08048A40 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08048A44
	movs r0, #1
	bl sub_8043190
	adds r0, r7, #0
	movs r1, #0xb
	bl Proc_Goto
	b _08048AAE
	.align 2, 0
_08048A40: .4byte 0x085775CC
_08048A44:
	adds r4, r6, #0
	movs r0, #0
	ldrsh r3, [r4, r0]
	cmp r3, #1
	bne _08048A68
	ldr r0, _08048AB8 @ =0x03004EB0
	ldr r1, _08048ABC @ =0x03004E10
	ldr r1, [r1]
	adds r1, #0xc0
	ldr r2, _08048AC0 @ =0x03004EAC
	ldr r2, [r2]
	subs r2, #0xc0
	str r3, [sp]
	movs r3, #4
	bl sub_804EBF0
	movs r0, #2
	strh r0, [r4]
_08048A68:
	ldr r4, _08048AB8 @ =0x03004EB0
	adds r0, r4, #0
	bl sub_804E790
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _08048A9E
	ldrb r0, [r4, #0x18]
	cmp r0, #0
	bne _08048A9E
	ldrb r5, [r4, #0x1e]
	cmp r5, #2
	bne _08048A9E
	ldr r0, _08048ABC @ =0x03004E10
	ldr r1, [r0]
	adds r1, #0xc0
	ldr r0, _08048AC0 @ =0x03004EAC
	ldr r2, [r0]
	subs r2, #0xc0
	movs r0, #1
	str r0, [sp]
	adds r0, r4, #0
	movs r3, #4
	bl sub_804EBF0
	strh r5, [r6]
_08048A9E:
	ldr r0, _08048AB8 @ =0x03004EB0
	bl MultiBootCheckComplete
	cmp r0, #0
	beq _08048AAE
	adds r0, r7, #0
	bl sub_8002DE4
_08048AAE:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08048AB8: .4byte 0x03004EB0
_08048ABC: .4byte 0x03004E10
_08048AC0: .4byte 0x03004EAC

