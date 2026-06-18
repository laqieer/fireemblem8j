	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set PutText, 0x08003DA0 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003D84, 0x08003D84 + 1
	.set sub_8003F28, 0x08003F28 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_804E5A0, 0x0804E5A0 + 1
	.section .text.sub_804504C, "ax", %progbits
@ NameSelect_DrawName @ JP 0x0804504C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global NameSelect_DrawName
	.thumb_func
NameSelect_DrawName:
	push {r4, lr}
	adds r0, #0x3b
	movs r1, #1
	strb r1, [r0]
	bl sub_804E5A0
	ldr r4, _08045098 @ =0x0203DAAC
	adds r0, r4, #0
	bl sub_8003CF8
	ldr r0, _0804509C @ =0x000007C2
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8003F28
	adds r0, r4, #0
	movs r1, #0x26
	bl sub_8003D84
	ldr r0, _080450A0 @ =0x000007C3
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8003F28
	ldr r1, _080450A4 @ =0x02022FBE
	adds r0, r4, #0
	bl PutText
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08045098: .4byte 0x0203DAAC
_0804509C: .4byte 0x000007C2
_080450A0: .4byte 0x000007C3
_080450A4: .4byte 0x02022FBE

