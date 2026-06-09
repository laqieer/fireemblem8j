	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set sub_80011D0, 0x080011D0 + 1
	.section .text.sub_8083348, "ax", %progbits
@ sub_8083348 @ JP 0x08083348 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8083348
	.thumb_func
sub_8083348:
	push {lr}
	ldr r0, _0808335C @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_0808335C: .4byte 0x02023CA8

