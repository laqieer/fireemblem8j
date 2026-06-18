	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set SetTextFont, 0x08003C68 + 1
	.set sub_80042E0, 0x080042E0 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_80483F0, 0x080483F0 + 1
	.set sub_804EEBC, 0x0804EEBC + 1
	.set sub_804F0EC, 0x0804F0EC + 1
	.set sub_8088DE8, 0x08088DE8 + 1
	.section .text.sub_8048648, "ax", %progbits
@ XMapTransfer_4 @ JP 0x08048648 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global XMapTransfer_4
	.thumb_func
XMapTransfer_4:
	push {r4, r5, lr}
	sub sp, #0xc
	movs r0, #6
	bl sub_804EEBC
	movs r5, #0
	str r5, [sp]
	movs r0, #0xd
	movs r1, #0xb
	movs r2, #0x10
	movs r3, #6
	bl sub_804F0EC
	ldr r0, _080486A4 @ =0x0203DB60
	bl SetTextFont
	bl sub_80042E0
	ldr r4, _080486A8 @ =0x0203DA84
	movs r0, #0x59
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	bl sub_80483F0
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r2, _080486AC @ =0x02023084
	movs r3, #0xc0
	lsls r3, r3, #7
	movs r1, #0x64
	str r1, [sp]
	str r5, [sp, #4]
	str r1, [sp, #8]
	movs r1, #0xd
	bl sub_8088DE8
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080486A4: .4byte 0x0203DB60
_080486A8: .4byte 0x0203DA84
_080486AC: .4byte 0x02023084

