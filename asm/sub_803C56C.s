	.syntax unified
	.set memcpy, 0x080D6908 + 1
	.set sub_80D65C0, 0x080D65C0 + 1
	.section .text.sub_803C56C, "ax", %progbits
@ AiScript_Exec @ JP 0x0803C56C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global AiScript_Exec
	.thumb_func
AiScript_Exec:
	push {r4, lr}
	sub sp, #0x70
	adds r4, r0, #0
	ldr r1, _0803C594 @ =0x080DCDD8
	mov r0, sp
	movs r2, #0x70
	bl memcpy
	ldr r1, _0803C598 @ =0x030017C8
	ldr r0, [r1]
	ldrb r0, [r0]
	cmp r0, #0x1c
	bls _0803C5A8
	ldr r0, _0803C59C @ =0x030017C4
	ldr r0, [r0]
	cmp r0, #0
	bne _0803C5A4
	ldr r0, _0803C5A0 @ =0x085D2034
	b _0803C5A6
	.align 2, 0
_0803C594: .4byte 0x080DCDD8
_0803C598: .4byte 0x030017C8
_0803C59C: .4byte 0x030017C4
_0803C5A0: .4byte 0x085D2034
_0803C5A4:
	ldr r0, _0803C5CC @ =0x085D2044
_0803C5A6:
	str r0, [r1]
_0803C5A8:
	ldr r1, _0803C5D0 @ =0x0203AA00
	ldr r0, _0803C5D4 @ =0x030017C8
	ldr r2, [r0]
	ldrb r0, [r2, #2]
	adds r1, #0x7e
	strb r0, [r1]
	ldrb r0, [r2]
	lsls r0, r0, #2
	add r0, sp
	ldr r1, [r0]
	adds r0, r4, #0
	bl sub_80D65C0
	add sp, #0x70
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803C5CC: .4byte 0x085D2044
_0803C5D0: .4byte 0x0203AA00
_0803C5D4: .4byte 0x030017C8

