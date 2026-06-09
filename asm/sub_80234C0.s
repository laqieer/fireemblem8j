	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set SetTextFont, 0x08003C68 + 1
	.set j_TmCopyRect, 0x080DC0F4 + 1
	.section .text.sub_80234C0, "ax", %progbits
@ sub_80234C0 @ JP 0x080234C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80234C0
	.thumb_func
sub_80234C0:
	push {lr}
	movs r0, #0
	bl SetTextFont
	ldr r0, _080234EC @ =0x02003D2C
	ldr r1, _080234F0 @ =0x02022CFE
	movs r2, #9
	movs r3, #0x13
	bl j_TmCopyRect
	ldr r0, _080234F4 @ =0x0200422C
	ldr r1, _080234F8 @ =0x020234FE
	movs r2, #9
	movs r3, #0x13
	bl j_TmCopyRect
	movs r0, #3
	bl BG_EnableSyncByMask
	movs r0, #0xb
	pop {r1}
	bx r1
	.align 2, 0
_080234EC: .4byte 0x02003D2C
_080234F0: .4byte 0x02022CFE
_080234F4: .4byte 0x0200422C
_080234F8: .4byte 0x020234FE

