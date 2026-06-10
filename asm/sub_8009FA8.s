	.syntax unified
	.set CallARM_DecompText, 0x08002AF4 + 1
	.section .text.sub_8009FA8, "ax", %progbits
@ sub_8009FA8 @ JP 0x08009FA8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8009FA8
	.thumb_func
sub_8009FA8:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, _08009FCC @ =0x0202B6A8
	ldr r0, [r6]
	cmp r5, r0
	beq _08009FD8
	ldr r1, _08009FD0 @ =0x0814D08C
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r4, _08009FD4 @ =0x0202A6A8
	adds r1, r4, #0
	bl CallARM_DecompText
	str r5, [r6]
	adds r0, r4, #0
	b _08009FDA
	.align 2, 0
_08009FCC: .4byte 0x0202B6A8
_08009FD0: .4byte 0x0814D08C
_08009FD4: .4byte 0x0202A6A8
_08009FD8:
	ldr r0, _08009FE0 @ =0x0202A6A8
_08009FDA:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08009FE0: .4byte 0x0202A6A8

