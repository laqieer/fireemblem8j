	.syntax unified
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80130D8, 0x080130D8 + 1
	.section .text.sub_804E038, "ax", %progbits
@ sub_804E038 @ JP 0x0804E038 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804E038
	.thumb_func
sub_804E038:
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0x30
	mov r1, sp
	ldr r0, _0804E0E0 @ =0x080DF1F8
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	add r6, sp, #0x10
	adds r1, r6, #0
	ldr r0, _0804E0E4 @ =0x080DF208
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	add r0, sp, #0x20
	mov r8, r0
	mov r1, r8
	ldr r0, _0804E0E8 @ =0x080DF218
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _0804E0EC @ =0x085C7540
	ldr r1, _0804E0F0 @ =0x06014000
	bl sub_8013008
	ldr r0, _0804E0F4 @ =0x085C8BF8
	ldr r1, _0804E0F8 @ =0x06002000
	bl sub_8013008
	ldr r0, _0804E0FC @ =0x085D8A8C
	ldr r1, _0804E100 @ =0x06002800
	mov sb, r1
	bl sub_8013008
	ldr r5, _0804E104 @ =0x0202BCEC
	ldrb r0, [r5, #0xf]
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	ldr r4, _0804E108 @ =0x02020188
	adds r1, r4, #0
	bl sub_8013008
	adds r0, r4, #0
	mov r1, sb
	movs r2, #2
	movs r3, #3
	bl sub_80130D8
	ldrb r0, [r5, #0xf]
	lsls r0, r0, #2
	adds r6, r6, r0
	ldr r0, [r6]
	movs r1, #0xa0
	movs r2, #0x20
	bl sub_8000D68
	ldrb r0, [r5, #0xf]
	lsls r0, r0, #2
	add r8, r0
	mov r2, r8
	ldr r0, [r2]
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	ldr r1, _0804E10C @ =0x03001858
	ldrb r0, [r5, #0xf]
	str r0, [r1]
	movs r0, #0
	strb r0, [r5, #0xf]
	add sp, #0x30
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804E0E0: .4byte 0x080DF1F8
_0804E0E4: .4byte 0x080DF208
_0804E0E8: .4byte 0x080DF218
_0804E0EC: .4byte 0x085C7540
_0804E0F0: .4byte 0x06014000
_0804E0F4: .4byte 0x085C8BF8
_0804E0F8: .4byte 0x06002000
_0804E0FC: .4byte 0x085D8A8C
_0804E100: .4byte 0x06002800
_0804E104: .4byte 0x0202BCEC
_0804E108: .4byte 0x02020188
_0804E10C: .4byte 0x03001858

