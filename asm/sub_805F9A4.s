	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set sub_805660C, 0x0805660C + 1
	.set sub_80567B8, 0x080567B8 + 1
	.set sub_8056890, 0x08056890 + 1
	.section .text.sub_805F9A4, "ax", %progbits
@ sub_805F9A4 @ JP 0x0805F9A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805F9A4
	.thumb_func
sub_805F9A4:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl sub_8056890
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _0805F9E0
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_80567B8
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl sub_805660C
	b _0805F9F6
_0805F9E0:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _0805F9F6
	ldr r1, _0805F9FC @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r7, #0
	bl Proc_End
_0805F9F6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805F9FC: .4byte 0x0201774C

