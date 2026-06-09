	.syntax unified
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_809AF14, "ax", %progbits
@ sub_809AF14 @ JP 0x0809AF14 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809AF14
	.thumb_func
sub_809AF14:
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r2, r0, #0
	adds r4, r1, #0
	mov r1, sp
	ldr r0, _0809AF58 @ =0x081F560C
	ldm r0!, {r3, r5, r6}
	stm r1!, {r3, r5, r6}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _0809AF5C @ =0x08A9A624
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r2, r2, r1
	adds r1, r2, #0
	bl sub_8013008
	ldr r0, _0809AF60 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r1, [r0]
	movs r0, #0xc
	ands r0, r1
	add r0, sp
	ldr r0, [r0]
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0x20
	bl sub_8000D68
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809AF58: .4byte 0x081F560C
_0809AF5C: .4byte 0x08A9A624
_0809AF60: .4byte 0x0202BCEC

