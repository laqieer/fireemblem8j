	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set sub_80011D0, 0x080011D0 + 1
	.section .text.sub_8082718, "ax", %progbits
@ sub_8082718 @ JP 0x08082718 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8082718
	.thumb_func
sub_8082718:
	push {lr}
	ldr r0, _0808273C @ =0x02022CA8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _08082740 @ =0x020234A8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _08082744 @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	movs r0, #7
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_0808273C: .4byte 0x02022CA8
_08082740: .4byte 0x020234A8
_08082744: .4byte 0x02023CA8

