	.syntax unified
	.set GetROMChapterStruct, 0x08034520 + 1
	.set SetFlag, 0x080860A8 + 1
	.set sub_80C1E74, 0x080C1E74 + 1
	.section .text.sub_80858A8, "ax", %progbits
@ sub_80858A8 @ JP 0x080858A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80858A8
	.thumb_func
sub_80858A8:
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl sub_80C1E74
	cmp r0, #0
	beq _080858D0
	ldr r0, _080858DC @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	adds r0, #0x8e
	ldrb r0, [r0]
	cmp r5, r0
	bne _080858D0
	cmp r4, #0x65
	beq _080858D6
_080858D0:
	adds r0, r4, #0
	bl SetFlag
_080858D6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080858DC: .4byte 0x0202BCEC

