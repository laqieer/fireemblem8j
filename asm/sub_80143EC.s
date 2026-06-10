	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set InitText, 0x08003C8C + 1
	.set PutText, 0x08003DA0 + 1
	.set sub_8003D84, 0x08003D84 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8003E0C, 0x08003E0C + 1
	.set sub_8003F28, 0x08003F28 + 1
	.section .text.sub_80143EC, "ax", %progbits
@ sub_80143EC @ JP 0x080143EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80143EC
	.thumb_func
sub_80143EC:
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	mov sb, r0
	mov r8, r1
	adds r4, r2, #0
	adds r6, r3, #0
	ldr r5, _0801444C @ =0x030007F8
	adds r0, r5, #0
	adds r1, r4, #0
	bl InitText
	adds r0, r6, #0
	bl sub_8003E0C
	lsls r4, r4, #3
	subs r4, r4, r0
	subs r4, #1
	lsrs r0, r4, #0x1f
	adds r4, r4, r0
	asrs r4, r4, #1
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8003D84
	adds r0, r5, #0
	mov r1, r8
	bl sub_8003D90
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8003F28
	adds r0, r5, #0
	mov r1, sb
	bl PutText
	movs r0, #1
	bl BG_EnableSyncByMask
	adds r0, r5, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801444C: .4byte 0x030007F8

