	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set GetEfxHp, 0x08059890 + 1
	.section .text.sub_80748E4, "ax", %progbits
@ sub_80748E4 @ JP 0x080748E4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80748E4
	.thumb_func
sub_80748E4:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, _08074924 @ =0x0203E14E
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r6, [r0, r1]
	adds r0, r5, #0
	bl GetAnimPosition
	lsls r1, r6, #1
	adds r6, r1, r0
	adds r0, r6, #0
	bl GetEfxHp
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r6, #2
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r4, r0
	beq _0807492C
	cmp r0, #0
	beq _08074928
	movs r0, #0
	b _0807492E
	.align 2, 0
_08074924: .4byte 0x0203E14E
_08074928:
	movs r0, #1
	b _0807492E
_0807492C:
	movs r0, #2
_0807492E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

