	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80C71D8, "ax", %progbits
@ sub_80C71D8 @ JP 0x080C71D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C71D8
	.thumb_func
sub_80C71D8:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	adds r1, r3, #0
	cmp r1, #0
	beq _080C71F4
	ldr r0, _080C71F0 @ =0x08AC2510
	bl Proc_StartBlocking
	b _080C71FC
	.align 2, 0
_080C71F0: .4byte 0x08AC2510
_080C71F4:
	ldr r0, _080C7214 @ =0x08AC2510
	movs r1, #3
	bl sub_8002BCC
_080C71FC:
	adds r1, r0, #0
	adds r2, r1, #0
	adds r2, #0x29
	movs r0, #0xfb
	ands r0, r4
	strb r0, [r2]
	strh r5, [r1, #0x2e]
	strh r6, [r1, #0x30]
	adds r0, r1, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080C7214: .4byte 0x08AC2510

