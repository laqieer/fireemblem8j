	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80048B4, "ax", %progbits
@ sub_80048B4 @ JP 0x080048B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80048B4
	.thumb_func
sub_80048B4:
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _080048C8
	ldr r0, _080048C4 @ =0x08577F34
	bl sub_8002BCC
	b _080048D0
	.align 2, 0
_080048C4: .4byte 0x08577F34
_080048C8:
	ldr r0, _080048D4 @ =0x08577F34
	movs r1, #3
	bl sub_8002BCC
_080048D0:
	pop {r0}
	bx r0
	.align 2, 0
_080048D4: .4byte 0x08577F34

