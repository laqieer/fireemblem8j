	.syntax unified
	.set RegisterDataMove, 0x08001F64 + 1
	.set sub_80D6394, 0x080D6394 + 1
	.section .text.sub_805A6E0, "ax", %progbits
@ sub_805A6E0 @ JP 0x0805A6E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805A6E0
	.thumb_func
sub_805A6E0:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #8]
	ldr r4, _0805A70C @ =0x000003FF
	ands r4, r0
	lsls r4, r4, #5
	ldr r0, _0805A710 @ =0x06010000
	adds r4, r4, r0
	ldr r0, [r5, #0x28]
	ldr r1, [r5, #0x2c]
	bl sub_80D6394
	ldr r0, [r5, #0x2c]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r4, #0
	bl RegisterDataMove
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805A70C: .4byte 0x000003FF
_0805A710: .4byte 0x06010000

