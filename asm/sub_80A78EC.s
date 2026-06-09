	.syntax unified
	.set SaveBonusContentData, 0x080A8394 + 1
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_80A78EC, "ax", %progbits
@ sub_80A78EC @ JP 0x080A78EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A78EC
	.thumb_func
sub_80A78EC:
	push {r4, lr}
	sub sp, #4
	ldr r4, _080A7910 @ =0x02020188
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r2, _080A7914 @ =0x010000A2
	mov r0, sp
	adds r1, r4, #0
	bl sub_80D6370
	adds r0, r4, #0
	bl SaveBonusContentData
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A7910: .4byte 0x02020188
_080A7914: .4byte 0x010000A2

