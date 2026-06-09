	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_808DD70, "ax", %progbits
@ sub_808DD70 @ JP 0x0808DD70 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808DD70
	.thumb_func
sub_808DD70:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _0808DDA4 @ =0x08A738B8
	movs r1, #3
	bl sub_8002BCC
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	cmp r5, #0
	bge _0808DD8A
	adds r5, #7
_0808DD8A:
	asrs r0, r5, #3
	str r0, [r1, #0x2c]
	adds r0, r6, #0
	cmp r6, #0
	bge _0808DD96
	adds r0, #0xf
_0808DD96:
	asrs r0, r0, #4
	cmp r0, #5
	bgt _0808DDA8
	cmp r0, #0
	bge _0808DDAA
	movs r0, #0
	b _0808DDAA
	.align 2, 0
_0808DDA4: .4byte 0x08A738B8
_0808DDA8:
	movs r0, #5
_0808DDAA:
	str r0, [r1, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

