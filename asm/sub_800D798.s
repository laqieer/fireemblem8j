	.syntax unified
	.set memset, 0x080D6968 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_800D798, "ax", %progbits
@ sub_800D798 @ JP 0x0800D798 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800D798
	.thumb_func
sub_800D798:
	push {r4, r5, r6, lr}
	sub sp, #0x20
	adds r6, r0, #0
	mov r4, sp
	movs r5, #0
	movs r0, #4
	strh r0, [r4]
	strh r5, [r4, #2]
	str r3, [sp, #4]
	movs r0, #2
	strh r0, [r4, #8]
	strh r5, [r4, #0xa]
	str r1, [sp, #0xc]
	movs r0, #3
	strh r0, [r4, #0x10]
	strh r5, [r4, #0x12]
	str r2, [sp, #0x14]
	add r0, sp, #0x18
	movs r1, #0
	movs r2, #8
	bl memset
	ldr r0, _0800D7E4 @ =0x030005A8
	adds r2, r0, #0
	mov r1, sp
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4}
	stm r2!, {r3, r4}
	adds r1, r6, #0
	bl sub_8002BCC
	add sp, #0x20
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800D7E4: .4byte 0x030005A8

