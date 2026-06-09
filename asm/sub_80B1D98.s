	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80B1DD8, 0x080B1DD8 + 1
	.section .text.sub_80B1D98, "ax", %progbits
@ sub_80B1D98 @ JP 0x080B1D98 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B1D98
	.thumb_func
sub_80B1D98:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_80B1DD8
	cmp r0, #0
	bne _080B1DB0
	ldr r0, _080B1DB8 @ =0x08A9DB6C
	adds r1, r5, #0
	bl sub_8002BCC
	str r4, [r0, #0x2c]
_080B1DB0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B1DB8: .4byte 0x08A9DB6C

