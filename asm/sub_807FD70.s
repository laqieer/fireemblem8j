	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set SetDefaultColorEffects, 0x08001ED0 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8014494, 0x08014494 + 1
	.section .text.sub_807FD70, "ax", %progbits
@ sub_807FD70 @ JP 0x0807FD70 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807FD70
	.thumb_func
sub_807FD70:
	push {lr}
	bl sub_8014494
	ldr r0, _0807FDA4 @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	movs r0, #4
	bl BG_EnableSyncByMask
	bl SetDefaultColorEffects
	ldr r2, _0807FDA8 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	pop {r0}
	bx r0
	.align 2, 0
_0807FDA4: .4byte 0x02023CA8
_0807FDA8: .4byte 0x03003020

