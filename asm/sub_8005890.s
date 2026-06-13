	.syntax unified
	.set sub_800579C, 0x0800579C + 1
	.set sub_800582C, 0x0800582C + 1
	.section .text.PutFaceChibi, "ax", %progbits
@ PutFaceChibi @ JP 0x08005890 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global PutFaceChibi
	.thumb_func
PutFaceChibi:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r1
	adds r6, r2, #0
	adds r4, r3, #0
	ldr r5, [sp, #0x14]
	lsls r5, r5, #0x18
	asrs r5, r5, #0x18
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_800582C
	ldr r2, _080058C8 @ =0x000003FF
	ands r2, r6
	ldr r1, _080058CC @ =0x085B8F5C
	lsls r4, r4, #0xc
	adds r2, r2, r4
	mov r0, r8
	adds r3, r5, #0
	bl sub_800579C
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080058C8: .4byte 0x000003FF
_080058CC: .4byte 0x085B8F5C

