	.syntax unified
	.set WriteAndVerifySramFast, 0x080D6548 + 1
	.section .text.sub_80A8CA8, "ax", %progbits
@ sub_80A8CA8 @ JP 0x080A8CA8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A8CA8
	.thumb_func
sub_80A8CA8:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A8CC4 @ =0x0203E890
	movs r2, #0x8c
	lsls r2, r2, #3
	adds r1, r4, #0
	bl WriteAndVerifySramFast
	ldr r0, _080A8CC8 @ =0x0203E88C
	str r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A8CC4: .4byte 0x0203E890
_080A8CC8: .4byte 0x0203E88C

