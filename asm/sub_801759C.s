	.syntax unified
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_801759C, "ax", %progbits
@ sub_801759C @ JP 0x0801759C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801759C
	.thumb_func
sub_801759C:
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrb r5, [r4, #0xb]
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r2, _080175C0 @ =0x01000024
	mov r0, sp
	adds r1, r4, #0
	bl sub_80D6370
	strb r5, [r4, #0xb]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080175C0: .4byte 0x01000024

