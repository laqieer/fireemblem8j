	.syntax unified
	.set InitText, 0x08003C8C + 1
	.set sub_8003EAC, 0x08003EAC + 1
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_8036694, "ax", %progbits
@ sub_8036694 @ JP 0x08036694 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8036694
	.thumb_func
sub_8036694:
	push {r4, r5, r6, r7, lr}
	movs r7, #0
_08036698:
	lsls r5, r7, #3
	ldr r0, _080366DC @ =0x02002FDC
	adds r5, r5, r0
	adds r0, r5, #0
	movs r1, #4
	bl InitText
	ldr r1, _080366E0 @ =0x080DCCE4
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r6, [r0]
	adds r0, r6, #0
	bl sub_8009FA8
	adds r1, r0, #0
	movs r0, #0x20
	bl sub_8003EAC
	adds r4, r0, #0
	adds r0, r6, #0
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #3
	bl sub_80043B8
	adds r7, #1
	cmp r7, #5
	ble _08036698
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080366DC: .4byte 0x02002FDC
_080366E0: .4byte 0x080DCCE4

