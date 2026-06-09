	.syntax unified
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_80CA128, "ax", %progbits
@ sub_80CA128 @ JP 0x080CA128 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CA128
	.thumb_func
sub_80CA128:
	push {lr}
	movs r1, #0
	strh r1, [r0, #0x2c]
	ldr r0, _080CA13C @ =0x020228A8
	ldr r1, _080CA140 @ =0x0201CDD4
	movs r2, #0x80
	bl sub_80D636C
	pop {r0}
	bx r0
	.align 2, 0
_080CA13C: .4byte 0x020228A8
_080CA140: .4byte 0x0201CDD4

