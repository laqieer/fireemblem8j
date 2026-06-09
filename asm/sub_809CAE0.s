	.syntax unified
	.set InitText, 0x08003C8C + 1
	.set ResetText, 0x08003BC4 + 1
	.section .text.sub_809CAE0, "ax", %progbits
@ sub_809CAE0 @ JP 0x0809CAE0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809CAE0
	.thumb_func
sub_809CAE0:
	push {r4, r5, lr}
	bl ResetText
	ldr r5, _0809CB34 @ =0x02013590
	movs r4, #0xd
_0809CAEA:
	adds r0, r5, #0
	movs r1, #5
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0809CAEA
	ldr r5, _0809CB38 @ =0x02013600
	movs r4, #4
_0809CAFE:
	adds r0, r5, #0
	movs r1, #7
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0809CAFE
	ldr r4, _0809CB3C @ =0x02013628
	adds r0, r4, #0
	movs r1, #7
	bl InitText
	adds r0, r4, #0
	adds r0, #8
	movs r1, #0xa
	bl InitText
	adds r4, #0x10
	adds r0, r4, #0
	movs r1, #0xb
	bl InitText
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809CB34: .4byte 0x02013590
_0809CB38: .4byte 0x02013600
_0809CB3C: .4byte 0x02013628

