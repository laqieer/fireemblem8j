	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_800773C, 0x0800773C + 1
	.set sub_8008A40, 0x08008A40 + 1
	.set sub_8030BE4, 0x08030BE4 + 1
	.set sub_80D6374, 0x080D6374 + 1
	.section .text.sub_8006890, "ax", %progbits
@ sub_8006890 @ JP 0x08006890 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8006890
	.thumb_func
sub_8006890:
	push {r4, r5, r6, r7, lr}
	adds r7, r3, #0
	ldr r4, _08006918 @ =0x085B90D4
	ldr r3, [r4]
	movs r5, #0
	strb r0, [r3, #0xc]
	ldr r0, [r4]
	strb r1, [r0, #0xd]
	ldr r0, [r4]
	str r2, [r0]
	str r5, [r0, #4]
	movs r6, #1
	strb r6, [r0, #8]
	ldr r0, [r4]
	strb r5, [r0, #9]
	ldr r0, [r4]
	adds r0, #0x82
	strb r5, [r0]
	ldr r0, [r4]
	strb r5, [r0, #0xb]
	bl sub_8030BE4
	ldr r1, [r4]
	strb r0, [r1, #0x13]
	ldr r0, [r4]
	strb r5, [r0, #0x14]
	movs r0, #0xff
	bl sub_800773C
	ldr r1, [r4]
	movs r0, #0xff
	strb r0, [r1, #0xf]
	ldr r0, [r4]
	strb r5, [r0, #0x15]
	ldr r0, [r4]
	strb r5, [r0, #0x12]
	ldr r0, [r4]
	strb r6, [r0, #0x16]
	ldr r0, [r4]
	strb r5, [r0, #0x17]
	ldr r0, [r4]
	adds r1, r0, #0
	adds r1, #0x80
	movs r2, #0
	strh r5, [r1]
	str r5, [r0, #0x38]
	adds r0, #0x83
	strb r2, [r0]
	ldr r0, [r4]
	ldr r0, [r0]
	movs r1, #0
	bl sub_8008A40
	adds r0, #7
	movs r1, #8
	bl sub_80D6374
	ldr r1, [r4]
	adds r0, #2
	strb r0, [r1, #0xe]
	cmp r7, #0
	bne _08006920
	ldr r0, _0800691C @ =0x085B90F0
	movs r1, #3
	bl sub_8002BCC
	b _08006928
	.align 2, 0
_08006918: .4byte 0x085B90D4
_0800691C: .4byte 0x085B90F0
_08006920:
	ldr r0, _08006930 @ =0x085B90F0
	adds r1, r7, #0
	bl Proc_StartBlocking
_08006928:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08006930: .4byte 0x085B90F0

