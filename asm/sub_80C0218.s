	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_80C0218, "ax", %progbits
@ sub_80C0218 @ JP 0x080C0218 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C0218
	.thumb_func
sub_80C0218:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r1, [sp, #0x1c]
	cmp r1, #0
	beq _080C023C
	ldr r0, _080C0238 @ =0x08AC18EC
	bl Proc_StartBlocking
	b _080C0244
	.align 2, 0
_080C0238: .4byte 0x08AC18EC
_080C023C:
	ldr r0, _080C026C @ =0x08AC18EC
	movs r1, #3
	bl sub_8002BCC
_080C0244:
	adds r4, r0, #0
	adds r0, r4, #0
	adds r0, #0x29
	strb r5, [r0]
	adds r0, #1
	strb r6, [r0]
	strh r7, [r4, #0x2c]
	cmp r5, #0
	blt _080C0274
	lsls r0, r5, #5
	ldr r1, _080C0270 @ =0x02022AA8
	adds r0, r0, r1
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r1, r1, r2
	movs r2, #0x10
	bl sub_80D6370
	b _080C0284
	.align 2, 0
_080C026C: .4byte 0x08AC18EC
_080C0270: .4byte 0x02022AA8
_080C0274:
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080C02A4 @ =0x02022BE8
	ldr r2, _080C02A8 @ =0x01000010
	mov r0, sp
	bl sub_80D6370
_080C0284:
	bl sub_8001EE4
	adds r0, r4, #0
	adds r0, #0x30
	mov r1, r8
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x37
	movs r0, #1
	strb r0, [r1]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080C02A4: .4byte 0x02022BE8
_080C02A8: .4byte 0x01000010

