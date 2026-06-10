	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8008830, 0x08008830 + 1
	.section .text.sub_80087A4, "ax", %progbits
@ sub_80087A4 @ JP 0x080087A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80087A4
	.thumb_func
sub_80087A4:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08008800 @ =0x085B92D8
	bl Proc_StartBlocking
	adds r4, r0, #0
	adds r0, r5, #0
	bl sub_8008830
	adds r2, r4, #0
	adds r2, #0x64
	strh r0, [r2]
	adds r1, r4, #0
	adds r1, #0x66
	movs r0, #8
	strh r0, [r1]
	ldr r3, _08008804 @ =0x085B90D4
	ldr r0, [r3]
	ldrb r1, [r0, #0xe]
	adds r0, r4, #0
	adds r0, #0x68
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0x6a
	movs r0, #6
	strh r0, [r1]
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bge _080087E4
	movs r0, #0
	strh r0, [r2]
_080087E4:
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0x1d
	ble _080087F0
	movs r0, #0x1e
	strh r0, [r2]
_080087F0:
	ldr r0, [r3]
	strb r5, [r0, #0xf]
	ldr r1, [r3]
	ldrb r0, [r1, #0xe]
	strb r0, [r1, #0x10]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08008800: .4byte 0x085B92D8
_08008804: .4byte 0x085B90D4

