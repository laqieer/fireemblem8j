	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_805660C, 0x0805660C + 1
	.set sub_80567B8, 0x080567B8 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_806ED5C, "ax", %progbits
@ NewEfxPierceCriticalEffectBG @ JP 0x0806ED5C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global NewEfxPierceCriticalEffectBG
	.thumb_func
NewEfxPierceCriticalEffectBG:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0806ED98 @ =0x08603484
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, _0806ED9C @ =0x085F9DA0
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_80567B8
	ldr r0, _0806EDA0 @ =0x085FAA50
	movs r1, #0x20
	bl sub_80567E0
	ldr r0, [r4, #0x5c]
	ldr r1, _0806EDA4 @ =0x085FAC50
	ldr r2, _0806EDA8 @ =0x085FAF10
	bl sub_805660C
	bl sub_8056158
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806ED98: .4byte 0x08603484
_0806ED9C: .4byte 0x085F9DA0
_0806EDA0: .4byte 0x085FAA50
_0806EDA4: .4byte 0x085FAC50
_0806EDA8: .4byte 0x085FAF10

