	.syntax unified
	.set NewTargetSelection_Specialized, 0x08050818 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_80194BC, 0x080194BC + 1
	.set sub_8035610, 0x08035610 + 1
	.set sub_80D65C0, 0x080D65C0 + 1
	.section .text.DoUsePutTrap, "ax", %progbits
@ DoUsePutTrap @ JP 0x08029890 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global DoUsePutTrap
	.thumb_func
DoUsePutTrap:
	push {r4, r5, lr}
	adds r5, r2, #0
	bl sub_80D65C0
	ldr r0, _080298D4 @ =0x0202E4DC
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80194BC
	ldr r0, _080298D8 @ =0x085C57B8
	ldr r1, _080298DC @ =sub_8029874
	bl NewTargetSelection_Specialized
	adds r4, r0, #0
	adds r0, r5, #0
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8035610
	ldr r0, _080298E0 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080298CE
	movs r0, #0x6a
	bl m4aSongNumStart
_080298CE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080298D4: .4byte 0x0202E4DC
_080298D8: .4byte 0x085C57B8
_080298DC: .4byte 0x08029875  @ sub_8029874
_080298E0: .4byte 0x0202BCEC

