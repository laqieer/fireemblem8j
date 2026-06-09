	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_808306C, "ax", %progbits
@ sub_808306C @ JP 0x0808306C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808306C
	.thumb_func
sub_808306C:
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, _080830A4 @ =0x08A14D34
	adds r1, r3, #0
	bl Proc_StartBlocking
	ldr r2, _080830A8 @ =0x0202BCAC
	ldrh r1, [r2, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r4, r4, r1
	lsls r4, r4, #1
	adds r4, #1
	lsls r4, r4, #3
	str r4, [r0, #0x30]
	ldrh r1, [r2, #0xe]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r5, r5, r1
	lsls r5, r5, #1
	adds r5, #1
	lsls r5, r5, #3
	str r5, [r0, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080830A4: .4byte 0x08A14D34
_080830A8: .4byte 0x0202BCAC

