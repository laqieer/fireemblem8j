	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.set sub_8041818, 0x08041818 + 1
	.set sub_80418FC, 0x080418FC + 1
	.set sub_808B2A4, 0x0808B2A4 + 1
	.section .text.sub_8048BAC, "ax", %progbits
@ sub_8048BAC @ JP 0x08048BAC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8048BAC
	.thumb_func
sub_8048BAC:
	push {lr}
	ldr r0, _08048BD0 @ =0x085D325C
	bl Proc_EndEach
	ldr r0, _08048BD4 @ =0x085D3284
	bl Proc_EndEach
	ldr r0, _08048BD8 @ =0x085D3234
	bl Proc_EndEach
	bl sub_80418FC
	bl sub_808B2A4
	bl sub_8041818
	pop {r0}
	bx r0
	.align 2, 0
_08048BD0: .4byte 0x085D325C
_08048BD4: .4byte 0x085D3284
_08048BD8: .4byte 0x085D3234

