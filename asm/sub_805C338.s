	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.section .text.sub_805C338, "ax", %progbits
@ sub_805C338 @ JP 0x0805C338 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805C338
	.thumb_func
sub_805C338:
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r0, _0805C374 @ =0x0201FDB8
	ldr r0, [r0]
	ldr r1, _0805C378 @ =0x0201FDC4
	cmp r0, #0
	bne _0805C348
	ldr r1, _0805C37C @ =0x0201FF04
_0805C348:
	movs r2, #0
	ldr r5, [r3, #0x44]
	ldr r4, _0805C380 @ =0x03003020
_0805C34E:
	ldrh r0, [r4, #0x20]
	strh r0, [r1]
	adds r1, #2
	adds r2, #1
	cmp r2, #0x77
	bls _0805C34E
	ldrh r0, [r3, #0x2c]
	adds r0, #1
	strh r0, [r3, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r5
	bne _0805C36E
	adds r0, r3, #0
	bl Proc_End
_0805C36E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805C374: .4byte 0x0201FDB8
_0805C378: .4byte 0x0201FDC4
_0805C37C: .4byte 0x0201FF04
_0805C380: .4byte 0x03003020

