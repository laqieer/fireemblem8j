	.syntax unified
	.set EfxTmCpyBG, 0x080733B8 + 1
	.set sub_80D6394, 0x080D6394 + 1
	.section .text.sub_8077EA4, "ax", %progbits
@ sub_8077EA4 @ JP 0x08077EA4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8077EA4
	.thumb_func
sub_8077EA4:
	push {r4, lr}
	sub sp, #8
	lsls r1, r0, #1
	adds r1, r1, r0
	adds r1, #1
	ldr r0, _08077EDC @ =0x087AACC8
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r4, _08077EE0 @ =0x02019790
	adds r1, r4, #0
	bl sub_80D6394
	ldr r1, _08077EE4 @ =0x020244A8
	movs r0, #6
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBG
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08077EDC: .4byte 0x087AACC8
_08077EE0: .4byte 0x02019790
_08077EE4: .4byte 0x020244A8

