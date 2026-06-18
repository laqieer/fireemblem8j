	.syntax unified
	.set PutText, 0x08003DA0 + 1
	.set ResetText, 0x08003BC4 + 1
	.set sub_8003D98, 0x08003D98 + 1
	.set sub_8003F28, 0x08003F28 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_80887E0, "ax", %progbits
@ MenuCommand_DrawRouteSplit @ JP 0x080887E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global MenuCommand_DrawRouteSplit
	.thumb_func
MenuCommand_DrawRouteSplit:
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	ldr r0, [r4, #0x30]
	ldrh r0, [r0, #4]
	bl sub_8009FA8
	adds r6, r0, #0
	adds r5, r4, #0
	adds r5, #0x34
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0
	bl sub_8003D98
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8003F28
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	lsls r1, r1, #5
	adds r1, #1
	movs r2, #0x2a
	ldrsh r0, [r4, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0808882C @ =0x02022CA8
	adds r1, r1, r0
	adds r0, r5, #0
	bl PutText
	bl ResetText
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0808882C: .4byte 0x02022CA8

