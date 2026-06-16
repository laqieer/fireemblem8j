	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set PutTmRectSequential, 0x08014574 + 1
	.set SetBlendBackdropA, 0x08001E98 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set sub_8014B50, 0x08014B50 + 1
	.section .text.sub_80808C4, "ax", %progbits
@ MapAnimSilence_InitScreenConf @ JP 0x080808C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global MapAnimSilence_InitScreenConf
	.thumb_func
MapAnimSilence_InitScreenConf:
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, [r4, #0x30]
	movs r0, #0x84
	bl sub_8014B50
	ldr r5, _08080928 @ =0x02023CA8
	ldr r0, [r4, #0x30]
	cmp r0, #0
	bge _080808DC
	adds r0, #7
_080808DC:
	asrs r0, r0, #3
	subs r1, r0, #2
	ldr r0, [r4, #0x34]
	cmp r0, #0
	bge _080808E8
	adds r0, #7
_080808E8:
	asrs r2, r0, #3
	subs r2, #2
	ldr r3, _0808092C @ =0x00004140
	movs r0, #4
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	bl PutTmRectSequential
	movs r0, #4
	bl BG_EnableSyncByMask
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #0
	bl SetBlendBackdropA
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08080928: .4byte 0x02023CA8
_0808092C: .4byte 0x00004140

