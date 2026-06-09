	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_807AC60, "ax", %progbits
@ sub_807AC60 @ JP 0x0807AC60 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807AC60
	.thumb_func
sub_807AC60:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	adds r6, r2, #0
	ldr r4, _0807AC90 @ =0x08A12FC0
	adds r0, r4, #0
	bl Proc_Find
	adds r2, r0, #0
	cmp r2, #0
	bne _0807AC80
	adds r0, r4, #0
	movs r1, #3
	bl sub_8002BCC
	adds r2, r0, #0
_0807AC80:
	ldr r0, [r2, #0x58]
	cmp r0, #0
	bne _0807AC94
	str r5, [r2, #0x58]
	adds r0, r2, #0
	adds r0, #0x64
	b _0807ACA2
	.align 2, 0
_0807AC90: .4byte 0x08A12FC0
_0807AC94:
	ldr r0, [r2, #0x60]
	cmp r0, #0
	bne _0807ACA4
	adds r0, r5, r7
	str r0, [r2, #0x5c]
	adds r0, r2, #0
	adds r0, #0x66
_0807ACA2:
	strh r6, [r0]
_0807ACA4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

