	.syntax unified
	.set GetClassData, 0x0801911C + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003EAC, 0x08003EAC + 1
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_80C378C, "ax", %progbits
@ sub_80C378C @ JP 0x080C378C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C378C
	.thumb_func
sub_80C378C:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r4, #0x34
	adds r0, r4, #0
	bl sub_8003CF8
	adds r0, r5, #0
	bl GetClassData
	ldrh r0, [r0]
	bl sub_8009FA8
	adds r5, r0, #0
	movs r0, #0x40
	adds r1, r5, #0
	bl sub_8003EAC
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #5
	adds r3, r5, #0
	bl sub_80043B8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

