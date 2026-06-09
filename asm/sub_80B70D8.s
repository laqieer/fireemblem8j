	.syntax unified
	.set ResetUnitSprites, 0x0802662C + 1
	.section .text.sub_80B70D8, "ax", %progbits
@ sub_80B70D8 @ JP 0x080B70D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B70D8
	.thumb_func
sub_80B70D8:
	push {lr}
	ldr r0, _080B70F0 @ =0x08AAF6D8
	ldr r1, [r0]
	adds r1, #0x37
	ldrb r0, [r1]
	movs r2, #2
	orrs r0, r2
	strb r0, [r1]
	bl ResetUnitSprites
	pop {r0}
	bx r0
	.align 2, 0
_080B70F0: .4byte 0x08AAF6D8

