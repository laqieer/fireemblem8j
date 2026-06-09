	.syntax unified
	.set SetActiveClassReelSpell, 0x08070EFC + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80713E4, "ax", %progbits
@ sub_80713E4 @ JP 0x080713E4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80713E4
	.thumb_func
sub_80713E4:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0807140C @ =0x08603C4C
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	bl SetActiveClassReelSpell
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _08071410 @ =0x080E4AA6
	str r0, [r4, #0x48]
	ldr r0, _08071414 @ =0x08620254
	str r0, [r4, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807140C: .4byte 0x08603C4C
_08071410: .4byte 0x080E4AA6
_08071414: .4byte 0x08620254

