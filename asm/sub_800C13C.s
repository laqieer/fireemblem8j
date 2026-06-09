	.syntax unified
	.set sub_80C5628, 0x080C5628 + 1
	.section .text.sub_800C13C, "ax", %progbits
@ sub_800C13C @ JP 0x0800C13C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800C13C
	.thumb_func
sub_800C13C:
	push {r4, lr}
	sub sp, #4
	ldr r0, [r0, #0x38]
	ldr r1, [r0, #4]
	lsls r1, r1, #5
	ldr r0, _0800C174 @ =0x081F5D7C
	adds r1, r1, r0
	movs r2, #0x18
	ldrsh r0, [r1, r2]
	movs r2, #0x1a
	ldrsh r1, [r1, r2]
	mov r4, sp
	adds r4, #2
	mov r2, sp
	adds r3, r4, #0
	bl sub_80C5628
	ldr r1, _0800C178 @ =0x03005270
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r1, #2]
	ldrh r0, [r4]
	strh r0, [r1, #4]
	movs r0, #0
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800C174: .4byte 0x081F5D7C
_0800C178: .4byte 0x03005270

