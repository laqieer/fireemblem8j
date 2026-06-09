	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set sub_808CEA8, 0x0808CEA8 + 1
	.section .text.sub_808D3AC, "ax", %progbits
@ sub_808D3AC @ JP 0x0808D3AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808D3AC
	.thumb_func
sub_808D3AC:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808D3E0 @ =0x08A737F8
	bl Proc_Find
	adds r2, r4, #0
	adds r2, #0x59
	movs r1, #0
	strb r1, [r2]
	ldrh r1, [r0, #0x30]
	subs r1, #8
	subs r2, #9
	strb r1, [r2]
	ldrh r0, [r0, #0x32]
	subs r0, #8
	adds r1, r4, #0
	adds r1, #0x51
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	adds r1, #1
	bl sub_808CEA8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808D3E0: .4byte 0x08A737F8

