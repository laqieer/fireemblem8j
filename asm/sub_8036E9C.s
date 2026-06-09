	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set InitTextDb, 0x08003CB4 + 1
	.set ResetTextFont, 0x08003C50 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_80034C4, 0x080034C4 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80130D8, 0x080130D8 + 1
	.set sub_803660C, 0x0803660C + 1
	.set sub_8036694, 0x08036694 + 1
	.section .text.sub_8036E9C, "ax", %progbits
@ sub_8036E9C @ JP 0x08036E9C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8036E9C
	.thumb_func
sub_8036E9C:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08036F08 @ =0x085C91A0
	ldr r4, _08036F0C @ =0x02020188
	adds r1, r4, #0
	bl sub_8013008
	ldr r1, _08036F10 @ =0x06015D00
	adds r0, r4, #0
	movs r2, #4
	movs r3, #2
	bl sub_80130D8
	ldr r0, _08036F14 @ =0x085C924C
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	bl ResetTextFont
	bl sub_80034C4
	bl sub_803660C
	bl sub_8036694
	adds r0, r5, #0
	adds r0, #0x38
	movs r1, #6
	bl InitTextDb
	adds r0, r5, #0
	adds r0, #0x40
	movs r1, #6
	bl InitTextDb
	adds r0, r5, #0
	adds r0, #0x48
	movs r1, #7
	bl InitTextDb
	ldr r2, _08036F18 @ =0x0000FFFF
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
	adds r1, r5, #0
	adds r1, #0x33
	movs r0, #1
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08036F08: .4byte 0x085C91A0
_08036F0C: .4byte 0x02020188
_08036F10: .4byte 0x06015D00
_08036F14: .4byte 0x085C924C
_08036F18: .4byte 0x0000FFFF

