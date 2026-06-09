	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.set __divsi3, 0x080D65F8 + 1
	.set __modsi3, 0x080D6690 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_804D23C, "ax", %progbits
@ sub_804D23C @ JP 0x0804D23C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804D23C
	.thumb_func
sub_804D23C:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	mov r8, r1
	adds r5, r2, #0
	ldr r4, _0804D294 @ =0x085D4A24
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8002BCC
	adds r6, r0, #0
	mov r0, r8
	str r0, [r6, #0x58]
	str r5, [r6, #0x5c]
	cmp r5, #0
	bne _0804D26A
	movs r0, #0xb8
	lsls r0, r0, #7
	str r0, [r6, #0x5c]
_0804D26A:
	ldr r4, [r6, #0x58]
	adds r0, r4, #0
	movs r1, #3
	bl __modsi3
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #6
	str r1, [r6, #0x2c]
	adds r0, r4, #0
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #0xb
	str r0, [r6, #0x30]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804D294: .4byte 0x085D4A24

