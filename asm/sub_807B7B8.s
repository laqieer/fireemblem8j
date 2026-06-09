	.syntax unified
	.set AP_Update, 0x080091AC + 1
	.set sub_807B660, 0x0807B660 + 1
	.section .text.sub_807B7B8, "ax", %progbits
@ sub_807B7B8 @ JP 0x0807B7B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807B7B8
	.thumb_func
sub_807B7B8:
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x40
	ldrb r0, [r0]
	cmp r0, #0
	bne _0807B87A
	mov r5, sp
	adds r0, r4, #0
	mov r1, sp
	bl sub_807B660
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807B87A
	mov r0, sp
	ldrh r1, [r0]
	ldr r0, _0807B884 @ =0x000001FF
	ands r0, r1
	mov r1, sp
	strh r0, [r1]
	ldrh r1, [r5, #2]
	movs r0, #0xff
	ands r0, r1
	strh r0, [r5, #2]
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	adds r3, r0, #0
	cmp r1, #6
	beq _0807B854
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	beq _0807B854
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0x80
	bne _0807B854
	ldr r0, _0807B888 @ =0x0202BCEC
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0807B854
	adds r0, r4, #0
	adds r0, #0x4e
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r4, #0
	adds r1, #0x52
	movs r2, #0
	ldrsh r1, [r1, r2]
	adds r0, r0, r1
	asrs r0, r0, #4
	adds r0, #8
	asrs r0, r0, #4
	ldr r1, _0807B88C @ =0x0202E4E4
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r1, r4, #0
	adds r1, #0x4c
	movs r5, #0
	ldrsh r1, [r1, r5]
	adds r2, r4, #0
	adds r2, #0x50
	movs r5, #0
	ldrsh r2, [r2, r5]
	adds r1, r1, r2
	asrs r1, r1, #4
	adds r1, #8
	asrs r1, r1, #4
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807B87A
_0807B854:
	ldrb r0, [r3]
	cmp r0, #7
	bne _0807B868
	mov r2, sp
	ldrh r1, [r2, #2]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r0, r3, #0
	orrs r0, r1
	strh r0, [r2, #2]
_0807B868:
	ldr r0, [r4, #0x30]
	mov r1, sp
	movs r5, #0
	ldrsh r1, [r1, r5]
	mov r2, sp
	movs r3, #2
	ldrsh r2, [r2, r3]
	bl AP_Update
_0807B87A:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807B884: .4byte 0x000001FF
_0807B888: .4byte 0x0202BCEC
_0807B88C: .4byte 0x0202E4E4

