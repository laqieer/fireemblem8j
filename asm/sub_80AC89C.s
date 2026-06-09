	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set DrawMinimapInternal, 0x080AC674 + 1
	.set Minimap_InitProcVars, 0x080AD0C4 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_80ACDE8, 0x080ACDE8 + 1
	.section .text.sub_80AC89C, "ax", %progbits
@ sub_80AC89C @ JP 0x080AC89C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AC89C
	.thumb_func
sub_80AC89C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AC8D8 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AC8B2
	movs r0, #0x78
	bl m4aSongNumStart
_080AC8B2:
	adds r0, r4, #0
	bl Minimap_InitProcVars
	movs r4, #1
	rsbs r4, r4, #0
	adds r0, r4, #0
	bl sub_80ACDE8
	movs r0, #0
	adds r1, r4, #0
	bl DrawMinimapInternal
	movs r0, #3
	bl BG_EnableSyncByMask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AC8D8: .4byte 0x0202BCEC

