	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8056130, 0x08056130 + 1
	.set sub_805660C, 0x0805660C + 1
	.set sub_80567B8, 0x080567B8 + 1
	.set sub_8056890, 0x08056890 + 1
	.section .text.sub_806C32C, "ax", %progbits
@ sub_806C32C @ JP 0x0806C32C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806C32C
	.thumb_func
sub_806C32C:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, #0x2c
	adds r1, r6, #0
	adds r1, #0x44
	ldr r2, [r6, #0x48]
	bl sub_8056890
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _0806C362
	ldr r1, [r6, #0x4c]
	ldr r5, [r6, #0x54]
	ldr r0, [r6, #0x5c]
	lsls r4, r4, #2
	adds r1, r4, r1
	ldr r2, [r1]
	adds r1, r2, #0
	bl sub_805660C
	adds r4, r4, r5
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_80567B8
_0806C362:
	ldrh r0, [r6, #0x2e]
	adds r0, #1
	strh r0, [r6, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x30
	bne _0806C382
	bl sub_8056130
	ldr r1, _0806C388 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r6, #0
	bl sub_8002DE4
_0806C382:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806C388: .4byte 0x0201774C

