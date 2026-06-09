	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set sub_8070F08, 0x08070F08 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_8070F64, "ax", %progbits
@ sub_8070F64 @ JP 0x08070F64 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8070F64
	.thumb_func
sub_8070F64:
	push {r4, lr}
	sub sp, #4
	bl sub_8070F08
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r1, [r4, #0x14]
	ldr r2, _08070F90 @ =0x01000200
	mov r0, sp
	bl sub_80D636C
	movs r0, #1
	ldrh r4, [r4, #0x12]
	lsls r0, r4
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08070F90: .4byte 0x01000200

