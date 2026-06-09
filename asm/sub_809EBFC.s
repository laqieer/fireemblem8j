	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8004374, 0x08004374 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_809EBFC, "ax", %progbits
@ sub_809EBFC @ JP 0x0809EBFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809EBFC
	.thumb_func
sub_809EBFC:
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r4, _0809EC68 @ =0x02013570
	adds r0, r4, #0
	bl sub_8003CF8
	ldr r0, _0809EC6C @ =0x000004CB
	bl sub_8009FA8
	adds r1, r4, #0
	adds r4, #8
	ldr r5, _0809EC70 @ =0x0202400C
	movs r6, #0
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl sub_8004374
	adds r0, r4, #0
	bl sub_8003CF8
	ldr r0, _0809EC74 @ =0x000007BB
	bl sub_8009FA8
	adds r5, #0x82
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl sub_8004374
	ldr r0, _0809EC78 @ =0x000007BC
	bl sub_8009FA8
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0x20
	bl sub_8004374
	movs r0, #4
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809EC68: .4byte 0x02013570
_0809EC6C: .4byte 0x000004CB
_0809EC70: .4byte 0x0202400C
_0809EC74: .4byte 0x000007BB
_0809EC78: .4byte 0x000007BC

